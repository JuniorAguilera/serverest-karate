package usuarios;
import com.intuit.karate.junit5.Karate;

public class UsuariosRunnerTest {
    @Karate.Test
    Karate testUsuarios() {
        return Karate.run("eliminar_usuario").relativeTo(getClass());
    }
}
