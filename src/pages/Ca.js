import './Ca.css';
import logo from './logoh.svg';
import { Link } from 'react-router-dom';

const Ca = () => {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo"/>
        </header>
        <div className ="col md-4">
        Todo listo, califica tu experiencia.
        Formulario estrellas
        Formulario Pago
        Gracias por usar nuestros servicios
        <Link to="/inicioc" className="btn btn-outline-secondary">Volver al inicio</Link>
        </div>
      </div>
    );
  };
  
  export default Ca;