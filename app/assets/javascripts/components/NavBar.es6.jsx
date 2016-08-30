class NavBar extends React.Component {
  render () {

    return (
      <nav className="navbar navbar-light bg-faded">
          {this.props.current_user ? (<ul className="nav navbar-nav">
                                        <li className="nav-item active">
                                          <a className="nav-link" href="/filmfestival">Home </a></li>
                                        <li className="nav-item">
                                          <a className="nav-link" href="/sessions/logout">Logout</a>
                                        </li></ul>)
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
