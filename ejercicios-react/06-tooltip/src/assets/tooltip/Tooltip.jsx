import { useState, useRef, useEffect } from 'react'


function Tooltip({text, domRect}){
    let [position, setPosition] = useState({ x: 0, y: 0 })
    let tooltipElement = useRef()

    useEffect(() => {
        let { width, height } = tooltipElement.current.getBoundingClientRect();
        let coords = {}

        if(domRect.y < height){
            coords.y = domRect.y + height
        }else{
            coords.y = domRect.y - height
        }

        coords.x = domRect.x + (domRect.width / 2) - (width / 2)

        setPosition(coords)

    }, [domRect])

    return(
        <span ref={tooltipElement} style={ { left: position.x, top: position.y } } className="tooltip">{text}</span>
    )
}

export default Tooltip