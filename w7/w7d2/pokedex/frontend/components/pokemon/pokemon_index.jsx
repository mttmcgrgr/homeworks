import React from 'react';

class PokemonIndex extends React.Component {



  componentDidMount(){this.props.requestAllPokemon();}



  render() {
    // const { pokemon } = this.props;
    console.log("Hi");
    return(
      <div>
       {this.props.pokemon.map(poke => (
        <li key={poke.id}>
          <img src={poke.image_url} />
         {poke.name}
         {poke.poke_type}
         {poke.attack}
         {poke.defense}
         {poke.moves}
       </li>))}
     </div>
    );
  }
}

export default PokemonIndex;
