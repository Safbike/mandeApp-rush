import Formexr from '../formexreg';
import './Expertoregister.css';
import logo from './logonol.svg';

const Expertoregister = () => {
  return (
    <div className="Soyexperto">
      <header className="ExpertoR-header">
        <img src={logo} className="ExpertoR-logo" alt="logo"/>
      </header>
      <div className ="col md-4">
        <Formexr></Formexr>
      </div>
    </div>
  );
};

export default Expertoregister;
