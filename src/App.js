import './App.css';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from './pages/Home'
import Soycliente from './pages/Soycliente'
import Clienteregister from './pages/Clienteregister'
import Soyexperto from './pages/Soyexperto'
import Expertoregister from './pages/Expertoregister'
import Inicioc from './pages/Inicioc';
import Inicioe from './pages/Inicioe';

function App() {
  return (
    <BrowserRouter>
    <Routes>
    <Route index element={<Home />} />
    <Route path="soycliente" element={<Soycliente />} />
    <Route path="clienteregister" element={<Clienteregister />} />
    <Route path="soyexperto" element={<Soyexperto />} />
    <Route path="expertoregister" element={<Expertoregister />} />
    <Route path="inicioc" element={<Inicioc />}/>
    <Route path="inicioe" element={<Inicioe />} />
   </Routes>
   </BrowserRouter>
  );
}

export default App;
