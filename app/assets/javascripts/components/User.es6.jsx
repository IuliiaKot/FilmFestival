class UserNewForm extends React.Component {



  registerUser(e){
    e.preventDefault();
    // debugger
    $.ajax({
      url: '/users',
      method: 'post',
      data: {
        user: {
          first_name: this.refs.firstname.value,
          username: this.refs.username.value,
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

          <form className="form-horizontal" onSubmit={this.registerUser.bind(this)}>

            <div className="form-group">
              <label htmlFor="name" className="cols-sm-2 control-label">Your Name</label>
              <div className="cols-sm-10">
                <div className="input-group">
                  <span className="input-group-addon"><i className="fa fa-user fa" aria-hidden="true"></i></span>
                  <input ref='firstname' type="text" className="form-control" name="name" id="name"  placeholder="Enter your Name"/>
                </div>
              </div>
            </div>

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
              <label htmlFor="username" className="cols-sm-2 control-label">Username</label>
              <div className="cols-sm-10">
                <div className="input-group">
                  <span className="input-group-addon"><i className="fa fa-users fa" aria-hidden="true"></i></span>
                  <input ref='username' type="text" className="form-control" name="username" id="username"  placeholder="Enter your Username"/>
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
              <input type="submit" className="btn btn-primary btn-lg btn-block login-button" value="Register"/>
            </div>
            <div className="login-register">
              <a href="">Login</a>
            </div>
          </form>
        </div>
        </div>
        </div>


    )
  }
}
