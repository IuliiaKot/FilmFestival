class ReviewForm extends React.Component {


  createReview(e) {
    e.preventDefault();
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
      <div className='container'>
        <div className='col-md-6' onSubmit={this.createReview.bind(this)}>
          <form>
            <div className="form-group">
              <input ref='rating' type='integer' name='review[rating]' class="form-control"/>
            </div>
            <div className="form-group">
              <textarea ref='content' class="form-control" rows="8" cols='58'></textarea>
            </div>

            <div className="form-group ">
              <input type="submit" className="btn btn-primary btn-lg btn-block login-button" value="Submit"/>
            </div>
          </form>
        </div>
      </div>
    )
  }
}
