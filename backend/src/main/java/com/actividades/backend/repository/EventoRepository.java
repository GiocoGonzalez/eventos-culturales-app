package com.actividades.backend.repository;

import com.actividades.backend.model.Evento;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EventoRepository extends JpaRepository<Evento, Long> {

    List<Evento> findByCiudadIgnoreCase(String ciudad);
    }

