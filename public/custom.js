function addEstimateListener () {
    let select = document.getElementById("estimate-select")
    select.addEventListener("change", function () {
        handleChange(select.value)
    }
    
}

function handleChange (value) {
    console.log(value)
}