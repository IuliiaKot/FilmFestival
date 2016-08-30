class NavBar extends React.Component {
  render () {
    debugger
    return (
      <nav className="navbar navbar-light bg-faded">
        <ul className="nav navbar-nav">
          {this.refs.current_user ? ( <span><li className="nav-item active">
                      <a className="nav-link" href="#">Home <span className="sr-only"></span></a>
                    </li>
                    <li className="nav-item">
                      <a className="nav-link" href="#">Logout</a>
                    </li></span>):(<span><li class="nav-item">
                      <a className="nav-link" href="#">Register</a>
                    </li>
                    <li className="nav-item">
                      <a className="nav-link" href="#">Login</a>
                    </li></span>)}
        </ul>
      </nav>
    )
  }
}
