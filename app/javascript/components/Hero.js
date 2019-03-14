import React from "react"
import PropTypes from "prop-types"

class Hero extends React.Component {
  render () {
    return (
      <div className="card bg-dark text-white mb-3">
        <img src={this.props.hero.image_card_background} className="card-img" alt="hero"></img>
        <div className="card-img-overlay">
          <h5 className="card-title">{this.props.hero.name}</h5>
          <p className="card-text">
            <img src={this.props.hero.image_portrait} className="img-thumbnail" alt="hero"></img>
          </p>
        </div>
      </div>
    );
  }
}

Hero.propTypes = {
  name: PropTypes.string,
  imagePortrait: PropTypes.string,
  imageSplash: PropTypes.string,
  imageCardBackground: PropTypes.string
};

export default Hero
