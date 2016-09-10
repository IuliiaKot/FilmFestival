class NavBar extends React.Component {
  render () {
    let dropdown_categories = (<li className='dropdown'>
            <a href="#" className='dropdown-toggle' data-toggle='dropdown' role='button' aria-expanded='false'>Category <span className='caret'></span></a>
            <ul className='dropdown-menu' role="menu">
              {this.props.categories.map((category,idx) => {
                return (<li><a href='#'>{category.name}</a></li>)
              })}
            </ul>
          </li>)
    return (
      <nav className="navbar navbar-light bg-faded">
          {this.props.current_user ? (<ul className="nav navbar-nav">
                                        <li className="nav-item active">
                                          <a className="nav-link" href="/filmfestival">Home </a></li>
                                        <li className="nav-item">
                                          <a className="nav-link" href="/sessions/logout">Logout</a>
                                        </li>{dropdown_categories}</ul>)
                                    : (<ul className="nav navbar-nav">
                                        <li className="nav-item">
                                          <a className="nav-link" href="/users/new">Register</a></li>
                                        <li className="nav-item">
                                          <a className="nav-link" href="/sessions/login">Login</a>
                                        </li>
                                      </ul>)}
      </nav>
    )
  }
}
