import { useContext, useState, useEffect } from 'react';
import { SearchContext, SearchProvider } from '../context/SearchContext';
import fremeworksList from './items';
import ListView from './ListView';

// Prop drilling 
// componetes de presenttacion y compnentes 
function List() {
    let [items, setItems] = useState(fremeworksList);
    let { search } = useContext(SearchContext);
    
    useEffect(function(){
        if(!search || search === "") return;
        filterItems(search);
    }, [search])
    
    function filterItems(searchPattern) {
       let newItems = filterItemsBySearchPattern(searchPattern);
       setItems(newItems);
    }
    
    function filterItemsBySearchPattern(searchPattern) {
        let filterItems = fremeworksList.map(item => item.toLowerCase().includes(searchPattern.toLowerCase()) ? item :null )
        return filterItems;
    }

    return (
        <ListView elements={items} />
    )
}


export default List;