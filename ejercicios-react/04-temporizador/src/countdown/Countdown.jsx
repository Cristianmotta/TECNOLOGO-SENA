import {useEffect, useState} from 'react'

function Countdown() {
    
    let [targetSconds, setTargetSeconds] = useState(null);
    let [elapsedSeconds, setElapsedSeconds] = useState(0);

    useEffect(
        function() {
            if(targetSconds == null) return;
            //target seconds tiene un valor
            setElapsedSeconds(0)

            let interval = setInterval(function() {
                setElapsedSeconds((elapsedSeconds) => elapsedSeconds + 1);
            }, 1000)

            return() => (
                clearInterval(interval)
            );
        }, [targetSconds]
    );

    function parseForm(ev){
        ev.preventDefault();
        let seconds = ev.target.seconds.value;
        // console.log(seconds);
        setTargetSeconds(seconds);
    }

    if(elapsedSeconds >= targetSconds && targetSconds != null){
        return(
            <>
                <p>Termino el conteo!</p>
                <button onClick={() => setTargetSeconds(null)}>Reiniciar</button>
            </>
        )
    }

    if(targetSconds != null){
        return <p>Faltan {targetSconds - elapsedSeconds} segundos </p>
    }

    return(
        <>
            <p>¿Cuantos segundos quiere contar?</p>
            <form action="#" onSubmit={ (ev) => parseForm(ev)}>
                <input type="number" name="seconds" />
                <button>Iniciar</button>
            </form>
        </>
    )
}

export default Countdown