class ListMovies extends React.Component {


  render() {
    let data = this.props.movies
    debugger
    return (
      <div className='container'>
        <div className='row text-center'>
          {data.map((movie, idx) => {
            return (<div key={movie['id']} className='col-md-4'>
                      <header><a href={`/films/${movie['id']}`}>{movie['title']}</a></header>
                      {movie.categories.map((category, idx) => {
                        return (<a><span key={idx}>{category['name']} </span></a>)
                      })}
                      <img class='film' src={movie['poster']}></img>
                    </div>)
          })}
        </div>
      </div>
    )
  }
}
