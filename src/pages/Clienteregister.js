import './Clienteregister.css';
import logo from './logonol.svg';
import { Link } from 'react-router-dom';
import ContentRec from '../contentRec'
import Formclir from '../formclireg';

const Clienteregister = () => {
  return (
    <div className="Soycliente">
      <header className="ClienteR-header">
        <img src={logo} className="ClienteR-logo" alt="logo"/>
      </header>
      <div className ="col md-4">
      <div className ="Contenido-uno">
        <Formclir/>
        <ContentRec title="*Necesitamos una foto de un recibo de servicio
        público para verificar tu dirección" bgcolor="rgba(217, 217, 217, 1)"/>
      </div>
      </div>
    </div>
  );
};

export default Clienteregister;
