package com.actividades.backend;

import com.actividades.backend.model.Evento;
import com.actividades.backend.repository.EventoRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class BackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(BackendApplication.class, args);
	}
	@Bean
	CommandLineRunner init(EventoRepository eventoRepository) {
		return args -> {
			if (eventoRepository.count() == 0) { //Comentar despues esto, es para que no se repitan los inserts

				eventoRepository.save(new Evento("Concierto", "Madrid", "Musica"));
				eventoRepository.save(new Evento("Exposición de arte", "Valencia", "Arte"));
				eventoRepository.save(new Evento("Visitas guiadas", "Barcelona", "Turismo"));
			}
		};
	}

}
