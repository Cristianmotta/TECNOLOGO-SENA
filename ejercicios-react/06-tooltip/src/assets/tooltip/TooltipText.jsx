import Tooltip from './Tooltip'
import { useRef, useState } from 'react'

function TooltipText(props){
    let [tooltipDomRect, setTooltipDomRect] = useState();
    let [showTooltip, setShowTooltip] = useState(false);
    
    let spanElement = useRef();
    
    function handleMouseOver(){
        //console.log(spanElement.current);
        let domData = spanElement.current.getBoundingClientRect();
        //console.log(domData);
        setTooltipDomRect(domData);
        setShowTooltip(true);
    }
    return(
        <>
            <span className="tooltip-text" ref={spanElement} onMouseLeave={ ev => setShowTooltip(false) } onMouseOver={ ev => handleMouseOver(ev) }>
                {props.children}
            </span>
            {
                showTooltip && <Tooltip domRect={tooltipDomRect} text={props.tooltip} /> 
            }
        </>
    )
}

export default TooltipText