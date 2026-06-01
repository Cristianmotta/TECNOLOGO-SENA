import { useContext, useState, useEffect } from 'react';
import { SearchContext, SearchProvider } from '../context/SearchContext';
import fremeworksList from './items';
import ListView from './ListView';
import { ItemsProvider } from '../context/ItemsContext';

// Prop drilling 
// componetes de presenttacion y compnentes 
function List() {
    return (
    <SearchProvider>
        <ItemsProvider>
           <ListView />  
        </ItemsProvider>
    </SearchProvider>
        
    )
}

export default List;