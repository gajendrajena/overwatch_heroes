import React from "react"
import PropTypes from "prop-types"
import Hero from "./Hero.js"
import HeroSearch from "./HeroSearch.js"

class App extends React.Component {

  constructor(props, context) {
    super(props);
    this.state = {heroes: [], name: ''};
  }

  status(response) {
    if (response.status >= 200 && response.status < 300) {
      return Promise.resolve(response)
    } else {
      return Promise.reject(new Error(response.statusText))
    }
  }

  parseJson(response){
    return response.json();
  }

  fetchHeros = (data)=> {
    var _this = this;
    var url = '/api/heros';
    if(data.length > 0){
      url += '?name=' + data;
    }
    fetch(url, {dataType: 'json'})
      .then(_this.status)
      .then(_this.parseJson)
      .then(function(data) {
        console.log(data.length)
        _this.setState({heroes: data['heros']});
      }).catch(function(error) {
        console.log('Request failed', error);
      });
  }

  componentWillMount() {
    this.fetchHeros('');
  }

  handleUserInput = (name)=> {
    this.fetchHeros(name);
  }

  render () {
    var _this = this;
    return (
      <React.Fragment>
      <HeroSearch key='HeroSearch' onUserInput={_this.handleUserInput}/>
      {
        this.state.heroes.map(function(hero){
          return ( <Hero key={hero.id} hero={hero}></Hero>)
        })
      }
      </React.Fragment>
    );
  }
}

App.propTypes = {
  greeting: PropTypes.string
};

export default App;

