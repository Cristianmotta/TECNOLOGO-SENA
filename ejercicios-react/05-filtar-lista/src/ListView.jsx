function ListView({elements, funcFilterItems}){
    return(
        <div>
            <input type="text" name="" onChange={ ev => funcFilterItems(ev.target.value)}/>
            <ul>
                {
                    elements.map((nombre, index) => nombre && <li key={index}>{nombre}</li>)
                }
            </ul>
        </div>
    )
}

export default ListView