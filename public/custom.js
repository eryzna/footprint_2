let heading
let form
let select

document.addEventListener('DOMContentLoaded', function () {
    heading = document.getElementById('estimate-header')
    form = document.getElementById('estimate-form')
    select = document.getElementById('estimate-select')
    addEstimateListener()
});

function addEstimateListener () {
    select.addEventListener('change', function () {
        handleChange(select.value)
    })
}

function handleChange (value) {
    if (value == 'electricity') {
        addElectricityForm (value)
    } else if (value == 'flight') {
        addFlightForm (value)
    } else if (value == 'shipping') {
        addShippingForm (value)
    } else if (value == 'vehicle') {
        addVehicleForm (value)
    } else {
        addFuelForm (value)
    }
}

function addElectricityForm(value) {
    select.remove()
    heading.innerText = value
    let fieldOne = document.createElement()
}

function addFlightForm(value) {
    console.log(value)
}

function addShippingForm (value) {
    console.log(value)
}

function addVehicleForm (value) {
    console.log(value)
}

function addFuelForm (value) {
    console.log(value)
}


    const url = 'https://www.carboninterface.com/api/v1/estimates';
    let data = {type: electricity, electricity_unit: mwh, electricity_value: 42, country: us, state: fl}

    async function postData(url = '', data = {}) {
        // Default options are marked with *
        const response = await fetch(url, {
          method: 'POST', // *GET, POST, PUT, DELETE, etc.
          mode: 'cors', // no-cors, *cors, same-origin
          cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
          credentials: 'same-origin', // include, *same-origin, omit
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${apiKey}`,
            'Accept': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
          },
          redirect: 'follow', // manual, *follow, error
          referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
          body: JSON.stringify(data) // body data type must match "Content-Type" header
        });
        return response.json()
        //return response.json(); // parses JSON response into native JavaScript objects
      }
      
      postData('https://www.carboninterface.com/api/v1/estimates', {type: "electricity", electricity_unit: "mwh", electricity_value: 42, country: "us", state: "fl"})
        .then(data => {
          console.log(data); // JSON data parsed by `data.json()` call
        });