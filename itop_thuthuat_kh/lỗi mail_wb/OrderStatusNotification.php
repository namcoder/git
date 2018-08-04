<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OrderStatusNotification extends Mailable {

    use Queueable,
        SerializesModels;

    protected $order;
    protected $optionRepository;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($order) {
        $this->optionRepository = app('App\Repositories\Eloquents\OptionRepository');
        $this->order = $order;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build() {
        $email_system = $this->optionRepository->findWhere(['option_key' => 'email_system'])->first();
        $website_name = $this->optionRepository->getValue('website_name');
        $email_system = json_decode($email_system->option_value);
        if ($email_system->email_account !== '') {
            $from_email = $email_system->email_account;

            /*\Config::set('mail.username', $email_system->email_account);
            \Config::set('mail.password', $email_system->email_password);
            \Config::set('mail.host', $email_system->email_host);
            \Config::set('mail.port', $email_system->email_port);
            \Config::set('mail.encryption', $email_system->email_protocol);

            (new \Illuminate\Mail\MailServiceProvider(app()))->register();*/

        } else {
            $from_email = 'support@webitop.com';
        }
        $email_structure = $this->optionRepository->getValue('user-noti-email-structure');
        $email_structure = json_decode($email_structure);
        
        return $this->from($from_email, $email_system->email_name)
                        ->subject(json_decode($email_structure)->title)
                        ->view('emails.order-status-notification')
                        ->with([
                            'order' => $this->order
                        ])
                        ->with('website_name', $website_name)
                        ->with('email_structure', json_decode($email_structure));
    }

}
