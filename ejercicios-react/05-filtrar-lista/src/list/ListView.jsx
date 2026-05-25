function ListView({elements, functionFilterItems}) {
    return (
        <div>
            <input type="text" onChange={(e) => functionFilterItems(e.target.value)} />
            <ul>
                {
                    elements.map((nombre, index) => nombre && <li key={index}>{nombre}</li>)
                }
            </ul>
        </div>
    );
}

export default ListView;