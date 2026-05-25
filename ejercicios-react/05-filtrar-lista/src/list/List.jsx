import { useState } from 'react';
import fremeworksList from './items';
import ListView from './ListView';

// componetes de presenttacion y compnentes 
function List() {
    let [items, setItems] = useState(fremeworksList);
    
    function filterItems(searchPattern) {
        if (searchPattern === ""){
            setItems(fremeworksList);
        } else {
            let newItems = filterItemsBySearchPattern(searchPattern);
            setItems(newItems);
        }
    }
    
    function filterItemsBySearchPattern(searchPattern) {
        let filterItems = fremeworksList.map(item => item.toLowerCase().includes(searchPattern.toLowerCase()) ? item :null )
        return filterItems;
    }

    return (
        <ListView elements={items} functionFilterItems={filterItems} />
    )
}


export default List;