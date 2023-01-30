import './Home.css';
import logo from './logoh.svg';
import { Link } from 'react-router-dom';
import ContentRec from '../contentRec'


const Home = () => {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo"/>
      </header>
      <div className ="col md-4">
      <div className ="Contenido-uno">
        <ContentRec title=" Consigue personas trabajadoras,
        expertas y honestas para realizar labores del día a día
        en el hogar." bgcolor = "rgba(221, 232, 185, 0.35)"/>
      </div>
      <br/>
      <Link to="/soycliente" className="btn btn-outline-secondary">Soy Cliente</Link>
      <br/>
      <br/>
      <div className ="Contenido-dos">
        <ContentRec title= "¿Por qué nosotros?" contenido="Contamos con un
        sistema de registro completo y seguro para garantizar que tu
        experiencia sea satisfactoria" bgcolor = "rgba(221, 232, 185, 0.35)"/>
      </div>
      <br/>
      <Link to="/soyexperto" className="btn btn-outline-secondary">Soy Experto</Link>
      </div>
    </div>
  );
};

export default Home;
