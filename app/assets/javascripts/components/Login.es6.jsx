class Login extends React.Component {
  loginUser(e){
    e.preventDefault();
    // debugger
    $.ajax({
      url: '/sessions',
      method: 'post',
      data: {
        user: {
          email: this.refs.email.value,
          password: this.refs.password.value,
        }
      }
    })
  }

  render() {
    return (
      <div className="container">
        <div className="row main">
          <div className="panel-heading">
           <div className="panel-title text-center">
              <h1 className="title">Red Pandas Film Festival 2016</h1>
              <hr />
            </div>
          </div>

        <div className="main-login main-center">

          <form className="form-horizontal" onSubmit={this.loginUser.bind(this)}>

            <div className="form-group">
              <label htmlFor="email" className="cols-sm-2 control-label">Your Email</label>
              <div className="cols-sm-10">
                <div className="input-group">
                  <span className="input-group-addon"><i className="fa fa-envelope fa" aria-hidden="true"></i></span>
                  <input ref='email' type="email" className="form-control" name="email" id="email"  placeholder="Enter your Email" required="true"/>
                </div>
              </div>
            </div>

            <div className="form-group">
              <label htmlFor="password" className="cols-sm-2 control-label">Password</label>
              <div className="cols-sm-10">
                <div className="input-group">
                  <span className="input-group-addon"><i className="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                  <input ref='password' type="password" className="form-control" name="password" id="password"  placeholder="Enter your Password"/>
                </div>
              </div>
            </div>

            <div className="form-group ">
              <input type="submit" className="btn btn-primary btn-lg btn-block login-button" value="Login"/>
            </div>
            <div className="login-register">
              <a href="/users/new">Register</a>
            </div>
          </form>
        </div>
        </div>
        </div>


    )
  }
}
