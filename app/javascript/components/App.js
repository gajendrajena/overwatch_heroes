import React from "react"
import PropTypes from "prop-types"
import Hero from "./Hero.js"
import HeroSearch from "./HeroSearch.js"

class App extends React.Component {

  constructor(props, context) {
    super(props);
    this.triggerInfiniteScroll();
    this.state = {
      heroes: [],
      name: '',
      pagination: { per_page: 0, total_entries: 0, offset: 0, current_page: 1 }
    };
  }

  triggerInfiniteScroll = ()=> {
    var _this = this;
    window.addEventListener('load', function(){
      var listElm = document.querySelector('#infinite-list');
      listElm.style.height = window.innerHeight;

      listElm.addEventListener('scroll', function() {
        if (listElm.scrollTop + listElm.clientHeight >= listElm.scrollHeight) {
          console.log('scrolled to end')
          _this.fetchHeros({page: _this.state.pagination.current_page +1, append: true})
        }
      });
    }, false )
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

  fetchHeros = (params)=> {
    var _this = this;
    var url = '/api/heros?per_page=10'
    if(Object.keys(params) && Object.keys(params).length > 0 ){
      if(params.hasOwnProperty('page')){ url += '&page=' + params['page']; }
      if(params.hasOwnProperty('name')){ url += '&name=' + params['name']; }
    }

    fetch(url, {dataType: 'json'})
      .then(_this.status)
      .then(_this.parseJson)
      .then(function(data) {
        if(params['append']){
          var new_data = _this.state.heroes.concat(data["heros"]);
          _this.setState({heroes: new_data, pagination: data['pagination']});
        } else {
          _this.setState({heroes: data['heros'], pagination: data['pagination']});
        }
        console.log(new_data);
        console.log(_this.state.heroes);
      }).catch(function(error) {
        console.log('Request failed', error);
      });
  }

  componentWillMount() {
    this.fetchHeros({});
  }

  handleUserInput = (name)=> {
    this.fetchHeros({name: name});
  }

  render () {
    var _this = this;
    var pagination = this.state.pagination;
    return (
      <React.Fragment>
        <div className="row">
          <HeroSearch key='HeroSearch' onUserInput={_this.handleUserInput}/>
        </div>
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

