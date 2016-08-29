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
      // debugger
      this.setState({movies: response})
    })

    )
  }

  render() {
    // debugger
    return (
      <div className='container'>
        <div className='row text-center'>
          {this.state.movies.map((movie, idx) => {
            return (<div className='col-md-12'>
                      <header>{movie['title']}</header>
                      <span>{movie['category']['name']}</span>
                      <p>{movie['plot']}</p>
                      <img src={movie['poster']}></img>
                    </div>)
          })}
        </div>
      </div>
    )
  }
}
