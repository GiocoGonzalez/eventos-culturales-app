package com.actividades.backend.controller;

import com.actividades.backend.model.Evento;
import com.actividades.backend.repository.EventoRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/eventos")
@CrossOrigin(origins = "*")
public class EventoController {

    private final EventoRepository eventoRepository;

    public EventoController(EventoRepository eventoRepository) {
        this.eventoRepository = eventoRepository;
    }
    @GetMapping(("/traer"))
    public List<Evento> listarEventos(@RequestParam(required = false) String ciudad) {
        if (ciudad != null &&!ciudad.isBlank()) {
            return eventoRepository.findByCiudadIgnoreCase(ciudad);
        }
        return eventoRepository.findAll();
    }
    @PostMapping()
    public Evento adicionarEvento(@RequestBody Evento evento) {
        return eventoRepository.save(evento);
    }

    @DeleteMapping("/{id}")
    public String deleteEvento(@PathVariable Long id) {
        eventoRepository.deleteById(id);
        return "Evento removido exitosamente";
    }
//    @PutMapping ("api/eventos/editar")
//    public Evento editarEvento(@RequestBody Evento evento) {
//        return eventoRepository.save(evento);
//    }
}
