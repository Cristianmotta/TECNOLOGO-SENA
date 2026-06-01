import { createContext, useState, useEffect, useContext } from "react";
import fremeworksList from "../list/items";
import { SearchContext } from "./SearchContext";

export const ItemsContext = createContext([]);

export function ItemsProvider({ children }) {
    let [items, setItems] = useState(fremeworksList);
    let { search } = useContext(SearchContext);
    
    useEffect(function(){
        if(!search || search === ""){
            setItems(fremeworksList);
            return;
        };
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
        <ItemsContext.Provider value={items}>
            {children}
        </ItemsContext.Provider>
    )
}