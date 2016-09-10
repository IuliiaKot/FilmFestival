class MovieFilterBar extends React.Component {

  findFilmByCategory(e){
    // debugger
    e.preventDefault();
    $.ajax({
      method: 'get',
      url: `/api/v1/categories/${e.target.value}`
    }).done(response => {
      debugger
      this.props.onUpdate(response);
    })
  }

  render(){
    // debugger
    let dropdown_categories = (<li className='dropdown'>
          <a className="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
         Category
         <span className="caret"></span></a>
            <ul className='dropdown-menu' role='menu' onClick={this.findFilmByCategory.bind(this)}>
              {this.props.categories.map((category,idx) => {
                return (<option key={category.id} value={category.id}>{category.name}</option>)
              })}
            </ul>
          </li>)

    return (
        <ul className='navbar navbar-light bg-faded'>
          {dropdown_categories}
        </ul>
    )
  }
}
