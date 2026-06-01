import { useContext } from "react";
import { ItemsContext } from "../context/ItemsContext";

function ResultCounts() {
    const elements = useContext(ItemsContext);
    const  { search } = useContext(SearchContext);
    return (
        <p>Se encontraro {elements.filter( el => !!el ).length} elementos para la busqueda '{search}'</p>        
    )
}

export default ResultCounts;