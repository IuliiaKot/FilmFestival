class ReviewForm extends React.Component {


  createReview(e) {
    e.preventDefault();
    debugger
    let content = this.refs.content.value;
    let rating = this.refs.rating.value;
    $.ajax({
      method: 'post',
      url: `/api/v1/films/${this.props.data}/reviews`,
      data: {
        review: {
          content: content,
          rating: rating,
          user_id: this.props.user
        }
      }
    })
     .done((response) => {

      this.refs.content.value = '';
      this.refs.rating.value = '';

      this.props.onUpdate(response)
      })
  }

  render(){
    return (
        <div className='container col-md-10 form-review col-md-offset-1'>
          <form className="form-horizontal" onSubmit={this.createReview.bind(this)}>
            <div className="form-group">
              <label className="col-sm-2 control-label">Raiting</label>
              <div className="col-sm-10">
                <select ref='rating'className="form-control" id="raiting">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
              </div>
            </div>
            <div className="form-group">
              <label htmlFor="review" className="col-sm-2 control-label">Review</label>
              <div className="col-sm-10">
                <textarea ref='content' className="form-control review-textarea" id="review" rows="8" ></textarea>
              </div>
            </div>

            <div className="form-group">
              <div className="post-review-btn"><input type="submit" className="btn btn-primary btn-lg" value="Submit"/></div>
            </div>
          </form>

      </div>
    )
  }
}
