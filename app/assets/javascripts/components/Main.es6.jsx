class Main extends React.Component {

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
      debugger
      this.setState({movies: response})
    })
    )
  }

  updateMovies(movies_by_category){
    debugger
    this.setState({movies: movies_by_category})
    debugger
  }



  render(){
    // debugger
    return (
      <div>
        <MovieFilterBar categories={this.props.categories} onUpdate={this.updateMovies.bind(this)}/>
        <ListMovies movies={this.state.movies}/>
      </div>
    )
  }
}
