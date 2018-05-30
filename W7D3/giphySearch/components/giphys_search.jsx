import React from 'react';

import GiphysIndex from './giphys_index';


class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = { searchTerm: "" };
  }

  handleChange(e){
    e.preventDefault();
    let searchTerm = e.currentTarget.value;
    this.setState({ searchTerm });
  }

  handleSubmit(e){
    e.preventDefault();
    const { fetchSearchGiphys } = this.props;
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    fetchSearchGiphys(searchTerm);
    this.setState({ searchTerm: "" });
  }

  render() {
    const { giphys } = this.props;
    return (
      <div>
        <input value={this.state.searchTerm}
          onChange={(e) => this.handleChange(e)}/>
        <button onClick={(e) => this.handleSubmit(e)}>Submit</button>
        <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
