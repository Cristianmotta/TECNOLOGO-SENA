import Searchinput from "../form/Searchinput";

function ListView({elements}) {
    return (
        <div>
            <Searchinput />
            <ul>
                {
                    elements.map((nombre, index) => nombre && <li key={index}>{nombre}</li>)
                }
            </ul>
        </div>
    );
}

export default ListView;