class NavBar extends React.Component {

  findCategory(e){
    e.preventDefault();
    debugger
    // $.ajax({
    //   url: '',
    //   method: 'get'
    // })
  }


  render () {
    return (
      <nav className="navbar navbar-inverse">
        <div className="container-fluid">
          <div className="navbar-header">
            <a className="navbar-brand" href="/filmfestival">Fall Film Festival</a>
          </div>

          <div className="collapse navbar-collapse" id="myNavbar">
            <ul className="nav navbar-nav">
              <li className="active" href="/filmfestival"><a href="#">Home</a></li>
            </ul>
          {this.props.current_user ? (<ul className="nav navbar-nav navbar-right">
                                        <li>
                                          <a href="/sessions/logout"><span className="glyphicon glyphicon-log-out"></span> Logout</a>
                                        </li></ul>)
                                    : (<ul className="nav navbar-nav navbar-right">
                                        <li>
                                          <a href="/users/new"><span className="glyphicon glyphicon-user"></span> Register</a></li>
                                        <li>
                                          <a href="/sessions/login"><span className="glyphicon glyphicon-log-in"></span> Login</a>
                                        </li>
                                      </ul>)}
                      </div>
                    </div>
                  </nav>
    )
  }
}
