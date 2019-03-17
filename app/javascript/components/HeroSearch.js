// HeroSearch
import React from "react"
import PropTypes from "prop-types"
class HeroSearch extends React.Component {

  handleChange = (e)=> {
    var name = e.target.value;
    this.props.onUserInput(name);
  }

  render () {
    return (
      <React.Fragment>
        <div className="col-12 col-sm-6">
          <form className="form-inline my-2 my-lg-0">
            <div className="input-group mb-3">
              <div className="input-group-prepend">
                <span className="input-group-text" id="basic-addon3"> Search Heros</span>
              </div>
              <input className="form-control mr-sm-2" type="text" name='hero[name]'
                placeholder="Name"
                aria-label="Search"
                onChange={this.handleChange}>
              </input>
            </div>
          </form>
        </div>
      </React.Fragment>
    );
  }
}

export default HeroSearch
