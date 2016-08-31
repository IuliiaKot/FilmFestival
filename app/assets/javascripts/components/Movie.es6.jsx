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
    return (
      <div className='container'>
        <div className='row'>
          <div className='col-md-6'><img src={this.state.movie.poster}/></div>
          <div className='col-md-6'>
            <h4>Title: {this.state.movie.title}</h4>
            <h4>Director: {this.state.movie.director}</h4>
            <p><b>Plot</b>:{this.state.movie.plot}</p>
          </div>
        </div>

        <div className='row'>
          {this.state.reviews.map((obj, key) => {
              return (<div className='col-md-12 text-center'>
                       <span><b>Raiting:</b>{obj.rating}</span>
                       <span><b>Author:</b>{obj.user.username}</span>
                       <p>{obj.content}</p>
                      </div>)
          })}
        </div>

        <ReviewForm data={this.state.movie.id}  onUpdate={this.updateReview.bind(this)} user={this.props.current_user}/>
      </div>
    )
  }
}
