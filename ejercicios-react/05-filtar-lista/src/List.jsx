import { useState } from "react"
import ListView from "./ListView";
import frameworkList from "./frameworkList";
//Componentes de presentacion y componentes contenedores

function List() {
    let [items, setItems] = useState(frameworkList)

    function filterItems(searchPattern) {
        if(searchPattern === ""){
            setItems(frameworkList)
        }else{
            let newItems = filterItmesBysearchPattern(searchPattern);
            setItems(newItems);
        }
    }

    function filterItemBySearchPattern(searchPattern){
        let filterItems  = frameworkList.map(item =>  
            item.toLowerCase().includes(searchPattern.toLowerCase()) ? item : null)
            return filterItems;
    }

    return(
        <ListView elements={items} funcFilterItems={filterItems} />
    )
}

export default List
