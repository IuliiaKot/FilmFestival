class Movie extends React.Component {

  constructor(){
    super();
    this.state = {
      movie: '',
      reviews: []
    }
  }

  componentDidMount(){
    $.ajax({
      method: 'get',
      url: `/api/v1/films/${this.props.id}`
    })
    .done(response => {
      debugger
      this.setState({movie: response})
    });

    $.ajax({
      methdo: 'get',
      url: `/api/v1/films/${this.props.id}/reviews`
    })
    .done(response => {
      this.setState({ reviews: response})
    })
  }

  updateReview(review){
    this.setState({reviews: [review].concat(this.state.reviews)})
  }


  render() {
    // debugger
    return (
      <div className='movie'>
          <div className='row'>
            <div className='col-md-4'><img src={this.state.movie.poster}/></div>
            <div className='col-md-8'>
              <p><b>Title:</b> {this.state.movie.title} ({this.state.movie.year})</p>
              <p><b>Caregory:</b> {this.state.movie.category} ({this.state.movie.year})</p>
              <p><b>Runtime:</b> {this.state.movie.runtime}</p>
              <p><b>Released:</b> {this.state.movie.released}</p>
              <p><b>Director:</b> {this.state.movie.director}</p>
              <p><b>Writer:</b> {this.state.movie.writer}</p>
              <p><b>Plot:</b> {this.state.movie.plot}</p>
            </div>
          </div>

          <div className='row reviews'>
            {this.state.reviews.map((obj, key) => {
                return (<div className='one-review col-md-12'>
                          <div className='col-md-2 text-left'>
                            <span><b>Raiting: </b>{obj.rating}</span><br/>
                            <span><b>Author: </b>{obj.user.username}</span><br/>
                          </div>
                          <div className='col-md-10 '>
                            <p>{obj.content}</p>
                          </div>
                        </div>)
            })}
          </div>


        <ReviewForm data={this.state.movie.id}  onUpdate={this.updateReview.bind(this)} user={this.props.current_user}/>
      </div>
    )
  }
}
