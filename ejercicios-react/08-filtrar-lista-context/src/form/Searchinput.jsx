import { useContext } from "react";
import { SearchContext } from "../context/SearchContext";

function Searchinput() {
    const { setSearch } = useContext(SearchContext);
    return (
        <input type="text" onChange={(e) => setSearch(e.target.value)} />
    )
}

export default Searchinput;