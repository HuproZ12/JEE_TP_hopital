package Temp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class Util {
    private static final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
    private static final SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();

    public static Session getSession() {
        return sessionFactory.openSession();
    }

    public static void closeSession(Session session) {
        session.close();
    }
}