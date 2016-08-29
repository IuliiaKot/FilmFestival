class ListMovies extends React.Component {

  constructor(){
    super();
    this.state = {
      movies: []
    }
  }

  componentDidMount(){
    $.ajax({
      method: 'get',
      url: '/api/v1/films.json'
    }).done((response => {
      this.setState({movies: response})
    })

    )
  }

  render() {
    return (
      <div className='container'>
        <div className='row text-center'>
          {this.state.movies.map((movie, idx) => {
            return (<div className='col-md-12'>
                      <header>{movie['title']}</header>
                      <span></span>
                      <p>{movie['plot']}</p>
                      <img src={movie['poster']}></img>
                    </div>)
          })}
        </div>
      </div>
    )
  }
}
