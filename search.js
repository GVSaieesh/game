// const product=[
//   {
//     id: 0;
//     Image: "images/1.jpg";
//     title: "MARVEL SPIDER-MAN-2";
//     price: 11;
//   },
//   {
//     id: 1;
//     Image: "images/2.jpg";
//     title: "Resident Evil 4 REMAKE";
//     price: 12;
//   },
//   {
//     id: 2;
//     Image: "images/3.jpg";
//     title: "ELDEN RING";
//     price: 9;
//   },
//   {
//     id: 3;
//     Image: "images/4.jpg";
//     title: "GOD OF WAR";
//     price: 7;
//   },
// ]

// const categories = [...new Set(product.map((item) => {return item}))];

// document.getElementsById("search").addEventListener("keyup", (e) => {
//    const searchData = e.target.value.toLowerCase();
//    const filterData = categories.filter((item) => {
//         return (item.title.toLocaleLowerCase().includes(searchData))
//      })
//      displayItem(filterData)
// })

// const displayItem = (items) => {
//     document.getElementById("root").innerHTML = items.map((item) => {
//          var {Image, title, price} = item;
//          return(
//             <div class="box">
//                 <div class="img-box">
//                     <img class='images' src={Image} />
//                 </div>
//                 <div class="bottom">
//                     <p>{title}</p>
//                     <h2>${price}.00</h2>
//                     <button class="buy">Buy Now</button>
//                 </div>
//             </div>>
//          )
//     }