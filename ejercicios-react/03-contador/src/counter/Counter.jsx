import { useState  } from "react";

function Counter(){

    const [contador, setContador] = useState(0)
    return(
        <div>
            <p>
                Haz click {contador} veces a este boton
            </p>
            <button onClick={ ()=> { setContador(contador + 1)}}>
                Incrementar
            </button>
        </div>
    );
    
}
    

export default Counter;