// Mostrar el loader y el modal en orden
window.addEventListener("load", () => {
    // Simular el tiempo de carga (1 segundo para el loader)
    setTimeout(() => {
        // Ocultar el loader
        document.getElementById("loader").style.display = "none";
        
        // Mostrar el contenido principal
        const contenido = document.getElementById("contenido");
        contenido.style.display = "block";
    }, 1000); // 1 segundo para el loader

    // Mostrar el modal a los 1.5 segundos
    setTimeout(() => {
        const modal = document.getElementById("vent");
        modal.classList.add("mostrar"); // Agrega la clase para animación
    }, 1500); // 1.5 segundos
});

// Función para cerrar el modal
const cerrarVentanaInicio = () => {
    const modal = document.getElementById("vent");
    if (modal) {
        modal.style.display = "none"; // Ocultar el modal
    }
};




// menu hamburguesa
function toggleMenu() {
    const menu = document.querySelector('.menu');
    menu.style.display = (menu.style.display === 'flex') ? 'none' : 'flex';
}

// Alternar visibilidad de los submenús en móvil
document.querySelectorAll('.menu > li > a').forEach(item => {
    item.addEventListener('click', function (e) {
        const submenu = this.nextElementSibling;
        if (submenu && submenu.classList.contains('submenu')) {
            e.preventDefault(); // Evita redirección en enlaces con submenús
            submenu.style.display = (submenu.style.display === 'block') ? 'none' : 'block';
        }
    });
});

window.addEventListener('resize', function () {
    const menu = document.querySelector('.menu');
    if (window.innerWidth > 768) {
        menu.style.display = 'flex';
        document.querySelectorAll('.submenu').forEach(submenu => {
            submenu.style.display = 'none';
        });
    } else {
        menu.style.display = 'none';
    }
});

// Funciones del Slideshow (banner)
let slideIndex = 0;
const mostrarSlides = () => {
    const slides = document.querySelectorAll(".mySlides");
    slides.forEach((slide, index) => {
        slide.style.display = index === slideIndex ? "block" : "none";
    });
    slideIndex = (slideIndex + 1) % slides.length;
    setTimeout(mostrarSlides, 3000); // Cambia de imagen cada 3 segundos
};
mostrarSlides();


// Funciones del Carrito
let carrito = [];
const actualizarCarrito = () => {
    const contenedorCarrito = document.getElementById("productos-carrito");
    const totalCarrito = document.getElementById("total-carrito");
    contenedorCarrito.innerHTML = "";

    let total = 0;
    carrito.forEach((item, index) => {
        const productoDiv = document.createElement("div");
        productoDiv.className = "producto";
        productoDiv.innerHTML = `
        <p>${item.nombre} x${item.cantidad} 
        <span class="eliminar" onclick="eliminarDelCarrito(${index})">Eliminar</span></p>
        <p>Precio: $${item.precio * item.cantidad}</p>
    `;
        contenedorCarrito.appendChild(productoDiv);
        total += item.precio * item.cantidad;
    });

    totalCarrito.textContent = `Total: $${total.toFixed(2)}`;
    document.getElementById("carrito").style.display = carrito.length > 0 ? "block" : "none";
};

// Vaciar Carrito
document.getElementById("vaciar-carrito").addEventListener("click", () => {
    carrito = [];
    actualizarCarrito();
});

// Ventana Flotante para Detalles de Producto
const mostrarVentanaFlotante = (imagen, nombre, detalles, precio) => {
    const ventana = document.getElementById("ventana-flotante");
    document.getElementById("imagen-flotante").src = imagen;
    document.getElementById("nombre-flotante").textContent = nombre;
    document.getElementById("detalles-flotante").textContent = detalles;
    document.getElementById("precio-flotante").textContent = `Precio: $${precio}`;
    ventana.style.display = "block";

    // Configuración del botón "Agregar al Carrito"
    document.getElementById("agregar-carrito").onclick = () => {
        const cantidad = parseInt(document.getElementById("cantidad").value);
        agregarAlCarrito(nombre, precio, cantidad);
        cerrarVentana();
    };
};

// Cerrar Ventana Flotante
const cerrarVentana = () => {
    const ventana = document.getElementById("ventana-flotante");
    ventana.style.display = "none";
};

// Agregar al Carrito
const agregarAlCarrito = (nombre, precio, cantidad) => {
    const productoExistente = carrito.find(item => item.nombre === nombre);
    if (productoExistente) {
        productoExistente.cantidad += cantidad;
    } else {
        carrito.push({ nombre, precio, cantidad });
    }
    actualizarCarrito();
};

// Eliminar del Carrito
const eliminarDelCarrito = (index) => {
    carrito.splice(index, 1);
    actualizarCarrito();
};

// Función para mostrar y ocultar capa de vista previa
const mostrarCapaVistaPrevia = (elemento) => {
    const capa = elemento.querySelector(".capa-vista-previa");
    capa.style.opacity = 1
}

//funcion acordeon
document.querySelectorAll('.pregunta').forEach(pregunta => {
    pregunta.addEventListener('click', () => {
        pregunta.classList.toggle('active');
    });
});

// Mostrar la ventana modal al cargar la página
window.addEventListener("load", () => {
    const ventanaInicio = document.getElementById("vent");
    if (ventanaInicio) {
        ventanaInicio.style.display = "block"; // Muestra la ventana modal
    }
});



// Función para agregar un comentario
function agregarComentario() {
    const comentarioInput = document.getElementById("comentarioInput");
    const comentarioTexto = comentarioInput.value.trim();

    if (comentarioTexto !== "") {
        const comentariosLista = document.getElementById("comentarios-lista");

        // Crear nuevo comentario
        const comentarioItem = document.createElement("div");
        comentarioItem.classList.add("comentario-item");

        const comentarioParrafo = document.createElement("p");
        comentarioParrafo.textContent = comentarioTexto;

        // Botón de Actualizar
        const updateButton = document.createElement("button");
        updateButton.textContent = "Actualizar";
        updateButton.onclick = () => actualizarComentario(comentarioItem);

        // Botón de Eliminar
        const deleteButton = document.createElement("button");
        deleteButton.textContent = "Eliminar";
        deleteButton.onclick = () => eliminarComentario(comentarioItem);

        // Agregar elementos al comentario
        comentarioItem.appendChild(comentarioParrafo);
        comentarioItem.appendChild(updateButton);
        comentarioItem.appendChild(deleteButton);

        // Agregar comentario a la lista
        comentariosLista.appendChild(comentarioItem);

        // Limpiar campo de texto
        comentarioInput.value = "";
    } else {
        alert("Por favor, escribe un comentario antes de enviar.");
    }
}

// Función para actualizar un comentario
function actualizarComentario(comentarioItem) {
    const comentarioActual = comentarioItem.querySelector("p").textContent;

    const nuevaEntrada = prompt("Actualiza tu comentario:", comentarioActual);

    if (nuevaEntrada !== null && nuevaEntrada.trim() !== "") {
        comentarioItem.querySelector("p").textContent = nuevaEntrada;
        alert("Comentario actualizado correctamente.");
    } else if (nuevaEntrada.trim() === "") {
        alert("El comentario actualizado no puede estar vacío.");
    }
}

// Función para eliminar un comentario
function eliminarComentario(comentarioItem) {
    const confirmacion = confirm("¿Estás seguro de que deseas eliminar este comentario?");
    if (confirmacion) {
        comentarioItem.remove();
        alert("Comentario eliminado correctamente.");
    }
}

//formulario

// Obtener el modal
var modal = document.getElementById("myModal");

// Obtener el botón que abre el modal
var btn = document.getElementById("modalBtn");

// Obtener el elemento <span> que cierra el modal
var span = document.getElementsByClassName("close")[0];

// Cuando el usuario haga clic en el botón, abrir el modal
btn.onclick = function () {
    modal.style.display = "flex";
}

// Cuando el usuario haga clic en <span> (x), cerrar el modal
span.onclick = function () {
    modal.style.display = "none";
}

// Cuando el usuario haga clic fuera del modal, cerrarlo
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

