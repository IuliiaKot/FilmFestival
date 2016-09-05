class Body extends React.Component {
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

  render(){
    return(
      <ListMovies movies={this.state.movies}/>
    )
  }
}
