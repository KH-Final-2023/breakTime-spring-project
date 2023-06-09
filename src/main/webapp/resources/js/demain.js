
        
 
        const open = () => {
            document.querySelector(".reviewModal").classList.remove("hidden");
            
        }
        const close = () => {
        console.log('cdlose')
            document.querySelector(".reviewModal").classList.add("hidden");
        }
        document.querySelector(".reviewOpenBtn").addEventListener("click", open); 
        document.querySelector(".reviewCloseBtn").addEventListener("click", close); 
        document.querySelector(".reviewBg").addEventListener("click", close); 

