package com.ucreativa.servicesuma;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import java.util.List;

@SpringBootApplication
@RestController
public class ServiceSumaApplication {

	@Autowired
	private SumaRepository sumaRepository;

	public static void main(String[] args) {
		SpringApplication.run(ServiceSumaApplication.class, args);
	}

	@GetMapping("/suma/{numero1}/mas/{numero2}")
	public String suma (@PathVariable String numero1, @PathVariable String numero2){
		int result = Integer.parseInt(numero1) + Integer.parseInt(numero2);
		FileRepo.salvar(Integer.toString(result), "suma.txt");
		this.sumaRepository.save(new Suma(numero1.toString() +"+"+ numero2.toString(), result ));
		return Integer.toString(result);
	}

	@GetMapping("/sumas/")
	public List<Suma> getSumas(){
		return sumaRepository.findAll();
	}

}
