module MessageBroker
  class Auditor
    def after_create(subject)
      puts "after_create #{subject}"
    end

    def after_update(subject)
      puts "after_update #{subject}"
    end

    def after_destroy(subject)
      # push_audit_for('destroy', subject)
    end

  end
end
