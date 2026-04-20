import imagenFoto from './assets/c.jpg'

function PresentationCard(){
    let name = "Cristian Motta"
    return(
        <div className="presentation-card">
            <img src={imagenFoto} alt="Avatar" className='Avatar'/>
            <h1>Hola soy {name}</h1>
            <p>Y estoy aprendiendo react</p>
        </div>
    );
};

export default PresentationCard