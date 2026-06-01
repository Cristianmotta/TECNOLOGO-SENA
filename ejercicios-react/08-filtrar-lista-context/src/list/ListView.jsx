import { useContext } from "react";
import { ItemsContext } from "../context/ItemsContext";
import Searchinput from "../form/Searchinput";
import ResultCounts from "./ResultConuts";

function ListView() {
    let elements = useContext(ItemsContext);
    return (
        <div>
            <Searchinput />
            <ResultCounts />
            <ul>
                {
                    elements.map((nombre, index) => nombre && <li key={index}>{nombre}</li>)
                }
            </ul>
        </div>
    );
}

export default ListView;